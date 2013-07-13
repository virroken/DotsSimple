import java.util.List;


private int GRID_SIZE = 50;
private int DOT_SIZE = 25;

private int X_OFFSET = 100;
private int Y_OFFSET = 75;

private int NUM_ROWS = 5;
private int NUM_COLS = 5;

private int m_prevX = 0;
private int m_prevY = 0;

private List<PVector> m_selected = new ArrayList<PVector>();

void setup()
{
  size( 480, 320 );
  
  strokeWeight( 5 );
}

void draw()
{
  
  background( 125);
  
  for( int x = 0; x < NUM_ROWS; x++ )
  {
    for( int y = 0; y < NUM_COLS; y++ )
    {
       int l_x = X_OFFSET + GRID_SIZE * x;
       int l_y = Y_OFFSET + GRID_SIZE * y;
       
       ellipse( l_x, l_y, DOT_SIZE, DOT_SIZE );
    }
  }
  
  for( int i = 0; i < m_selected.size()-1; i++ )
  {
    PVector l_start = m_selected.get(i);
    PVector l_end = m_selected.get(i+1);
    
    line( (l_start.x * GRID_SIZE) + X_OFFSET, (l_start.y * GRID_SIZE) + Y_OFFSET, (l_end.x * GRID_SIZE) + X_OFFSET, (l_end.y*GRID_SIZE) + Y_OFFSET );
  }
  
  if( m_selected.size() > 0 )
  {
    PVector l_last = m_selected.get( m_selected.size() - 1 );
    line( l_last.x * GRID_SIZE + X_OFFSET, l_last.y * GRID_SIZE + Y_OFFSET, mouseX, mouseY );
  }
  
}

void mousePressed()
{
  int l_x = (int)(mouseX - X_OFFSET - (DOT_SIZE*0.5)) / GRID_SIZE;
  int l_y = (int)(mouseY - Y_OFFSET - (DOT_SIZE*0.5)) / GRID_SIZE;
  
  m_prevX = l_x;
  m_prevY = l_y;
  
  println( "" + l_x +", " + l_y );
}

void mouseReleased()
{
  m_selected.clear();
  
  m_prevX = -1;
  m_prevY = -1;
}

void mouseDragged()
{
   int l_x = (int)(mouseX - X_OFFSET + (DOT_SIZE*0.5)) / GRID_SIZE;
  int l_y = (int)(mouseY - Y_OFFSET + (DOT_SIZE*0.5)) / GRID_SIZE;
  
  if( l_x != m_prevX ) {
    if( l_x >= m_prevX-1 && l_x <= m_prevX+1 )
    {
      m_prevX = l_x;
      addPoint( l_x, l_y );
      return;
    }
  }
  
  if( l_y != m_prevY )
  {
    if( l_y >= m_prevY-1 && l_y <= m_prevY +1 )
   {
     m_prevY = l_y;
     addPoint( l_x, l_y );
   } 
  }
  
  println( "" + l_x +", " + l_y ); 
}

void addPoint( float p_x, float p_y )
{
 PVector l_vector = new PVector();
 l_vector.x = p_x;
l_vector.y = p_y;

m_selected.add( l_vector );

}
